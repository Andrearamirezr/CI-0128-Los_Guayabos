import './AgregarProducto.css'
import { useNavigate } from 'react-router-dom'
import FormularioAgregar from './components/FormularioAgregar';
import { MdOutlineArrowBackIosNew } from "react-icons/md";
import { useState } from "react"

{/* Pagina para agregar un producto nuevo */ }
const AgregarProducto = () => {
    const navigate = useNavigate();

    { /* Metodo para regresar a la pagina anterior */}
    const regresar = e => {
        e.preventDefault();
        navigate('/inventario', {
            replace: true,
        });
    };

    return (
        <div className="container-fluid bg-ap p-4 min-vh-100">
            <div className="bg-surface m-4 p-4 rounded-4 shadow">
                <div className="row">
                    <div className="col-2 col-md-1 pt-1 text-end">
                        <button className="bt-volver" onClick={regresar}>
                            <MdOutlineArrowBackIosNew className="i-volver" />
                        </button>
                    </div>
                    <div className="col text-start pt-1">
                        <h1>Agregar producto</h1>
                    </div>
                </div>
                <FormularioAgregar />
                
            </div>
        </div>
    );
}

export default AgregarProducto;